# Personal Learning Launcher CLI for LINUX

A CLI to instantly manage and launch your learning resources—docs, tutorials, and more—resume forgotten tutorials, and stay on top of your learning every day, all at an instant, adding or removing resources directly from the terminal without touching the JSON.

note: Replace tutorial links with your preferred, high-quality resources
## Features

- Open resources by category and type
- Add new categories or resource types
- Remove existing categories or resource types
- List all available resources
- Scales easily without manual JSON edits

## Installation

1. Clone the repository:

```bash
git clone https://github.com/YOUR_USERNAME/personal-learning-launcher.git
cd personal-learning-launcher
````

2. Make the script executable:


```bash
chmod +x learn.sh
```

3. (Optional) Create a terminal alias for convenience:

```bash
echo 'alias learn="/full/path/to/personal-learning-launcher/learn.sh"' >> ~/.zshrc
source ~/.zshrc
```


## Usage

**1. Open a resource**  
Command: `learn open react tutorial`(it opens the tutorial video at exact position where you have left...suitable for youtube else start a new)

- Opens the link stored for the React tutorial in your default browser.
    
- No need to manually copy/paste the URL.
    
- Parameters:
    
    - `react` = the category
        
    - `tutorial` = the type of resource
        

**Why it matters:** You can instantly access any resource from your learning database with a single command.



**2. Add a new category or type**  
Command: `learn add nodejs tutorial https://www.youtube.com/...`

- Adds a new category (`nodejs`) or a new type (`tutorial`) with its URL to your JSON.
    
- You don’t have to edit the JSON file manually.
    

**Why it matters:** Lets your learning database grow dynamically as you add more resources.



**3. Remove a type or category**  
Commands:

- `learn remove react tutorial` → removes only the `tutorial` type from the `react` category.
    
- `learn remove django` → removes the entire `django` category.
    

**Why it matters:** Keeps your database clean and up-to-date by letting you delete resources selectively or remove a whole category.



**4. List all categories and types**  
Command: `learn list`

- Shows all categories and the resource types inside them.
    
- Example output:
    
    ```
    react: docs, tutorial
    django: docs, tutorial
    nodejs: tutorial
    ```
    

**Why it matters:** Gives you a quick overview of all your resources, so you know what’s available without opening the JSON manually.

-




## JSON Structure

```json
{
  "react": {
    "docs": "https://react.dev",
    "tutorial": "https://www.youtube.com/watch?v=abcd123&t=540s"
  },
  "django": {
    "docs": "https://docs.djangoproject.com",
    "tutorial": "https://www.youtube.com/watch?v=wxyz456&t=120s"
  }
}
```

- Keys = categories
    
- Sub-keys = type of resource
    
- Values = URLs
    



## Requirements

- `jq` for JSON parsing: `sudo apt install jq`
    
- `xdg-open` to launch URLs in the default browser
    



## Notes

- Alias path must point to the absolute location of `learn.sh`
    
- You can clone this repository anywhere, update the alias accordingly, and start using it immediately.
    

