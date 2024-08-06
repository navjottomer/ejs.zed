# Zed EJS Extension

This extension adds support for EJS (Embedded JavaScript) templating language to the Zed editor.
I don't know much about Zed editor apis and but I have tried to implement the syntax highlighting for EJS files as I was working on a project where I needed to work with EJS files.
So some googling and reading the Zed editor documentation I have implemented this extension.
Let me know if you have any suggestions or improvements.

## Installation

1. If my pull request accepted it will be available in the official Zed editor extension repository.
2. If not you can open the extension manager in Zed and click on `Install Dev Extension` and navigate to the directory where you have cloned this repository.

## Usage

Once installed, the extension will automatically activate for files with the `.ejs` extension.

### Syntax Highlighting

EJS syntax elements are highlighted as follows:
- EJS tags: `<% %>`, `<%= %>`, `<%- %>`, `<%_ %>`, `<%# %>`
- JavaScript code inside EJS tags
- HTML content outside EJS tags

## Contributing

Contributions to improve the extension are welcome! Please submit issues and pull requests on the GitHub repository.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Thanks to the Zed editor team for providing the extension API
- This extension uses the Tree-sitter grammar for embedded templates
- Existing Extensions under Zed editor repository

## Version History

- 0.0.1: Initial release with basic EJS support

![ejs-syntax-higlight](https://github.com/user-attachments/assets/a26abd2d-9cfa-4f07-a706-13dd85cdd321)

---

For more information on EJS, visit [EJS documentation](https://ejs.co/).
