
#!/bin/bash
# Script: learn.sh
# Purpose: Manage and open learning resources

JSON_FILE="/home/phantom0/MyFiles1/terminal_folder/personal_learning_launcher/learning_resources.json"

COMMAND="$1"
CATEGORY="$2"
TYPE="$3"
URL="$4"

# Check jq
#if ! command -v jq &> /dev/null; then
#    echo "Install jq first: sudo apt install jq"
#    exit 1
#fi

case "$COMMAND" in
    open)
        if [ -z "$CATEGORY" ] || [ -z "$TYPE" ]; then
            echo "Usage: $0 open <category> <type>"
            exit 1
        fi
        LINK=$(jq -r --arg c "$CATEGORY" --arg t "$TYPE" '.[$c][$t]' "$JSON_FILE")
        if [ "$LINK" = "null" ] || [ -z "$LINK" ]; then
            echo "No entry found for $CATEGORY -> $TYPE"
            exit 1
        fi
        xdg-open "$LINK"
        ;;
    
    add)
        if [ -z "$CATEGORY" ] || [ -z "$TYPE" ] || [ -z "$URL" ]; then
            echo "Usage: $0 add <category> <type> <url>"
            exit 1
        fi
        jq --arg c "$CATEGORY" --arg t "$TYPE" --arg u "$URL" '.[$c][$t]=$u' "$JSON_FILE" > tmp.$$.json && mv tmp.$$.json "$JSON_FILE"
        echo "Added $CATEGORY -> $TYPE"
        ;;

    remove)
        if [ -z "$CATEGORY" ]; then
            echo "Usage: $0 remove <category> [type]"
            exit 1
        fi
        if [ -z "$TYPE" ]; then
            # Remove entire category
            jq "del(.\"$CATEGORY\")" "$JSON_FILE" > tmp.$$.json && mv tmp.$$.json "$JSON_FILE"
            echo "Removed category $CATEGORY"
        else
            # Remove only type
            jq "del(.\"$CATEGORY\".\"$TYPE\")" "$JSON_FILE" > tmp.$$.json && mv tmp.$$.json "$JSON_FILE"
            echo "Removed $CATEGORY -> $TYPE"
        fi
        ;;

    list)
        echo "Learning resources:"
        jq -r 'to_entries[] | "\(.key): \(.value | keys | join(", "))"' "$JSON_FILE"
        ;;

    *)
        echo "Commands: open | add | remove | list"
        echo "Examples:"
        echo "  $0 open react tutorial"
        echo "  $0 add nodejs tutorial https://youtube.com/..."
        echo "  $0 remove react tutorial"
        echo "  $0 list"
        ;;
esac


