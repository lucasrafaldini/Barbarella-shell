# Contributing to Barbarella 💖

First off, welcome and thank you for taking the time to contribute to **Barbarella**! Whether you are a beginner participating in [Hacktoberfest](https://hacktoberfest.com/) or an experienced shell scripter, your contributions are very welcome.

---

## 🎃 Hacktoberfest Guidelines

Barbarella proudly participates in Hacktoberfest! We want your contributions to be meaningful, fun, and rewarded.

### Quality Standards:
- **No Spam**: PRs that only fix typos in comments, change trivial whitespaces, or add placeholder text without substance will be labeled as `spam` or `invalid` and will **not** count towards Hacktoberfest.
- **Cross-Shell Compatibility**: Barbarella supports both **Zsh** and **Bash** on macOS and Linux. If you modify core scripts, please ensure your changes do not break Bash or Zsh syntax.
- **Theme & Border Contributions**: If you submit a new theme or border, make sure it looks beautiful, includes hex/ANSI color definitions, and follows our design aesthetic.

---

## 💡 How Can I Contribute?

### 1. Propose or Add a New Theme
Check `themes/` for examples (e.g. `themes/barbie.sh`, `themes/vaporwave.sh`).
Themes define standard ANSI colors, icons, and a feminine/creative aesthetic.

### 2. Propose a New Border Style
Check `core/borders.sh`. We love:
- Retro MSN / ICQ text art.
- Aesthetic Unicode / Emoji prompt borders.
- Minimalist cute symbols.

### 3. Core Shell Improvements & Bug Fixes
- Enhancing macOS / Linux compatibility.
- Improving prompt render speed.
- Adding helpful shortcuts in `core/shortcuts.zsh` / `core/shortcuts.bash`.

### 4. Documentation & Translations
- Improving installation guides.
- Adding more translations to `README.*.md`.

---

## 🚀 Step-by-Step Workflow

1. **Fork the Repository**:
   Click the **Fork** button at the top right of [Barbarella-shell](https://github.com/lucasrafaldini/Barbarella-shell).

2. **Clone your fork**:
   ```bash
   git clone https://github.com/<your-username>/Barbarella-shell.git
   cd Barbarella-shell
   ```

3. **Create a descriptive feature branch**:
   ```bash
   git checkout -b feature/my-cool-theme
   ```

4. **Make your changes & test**:
   Test on your local shell:
   ```bash
   # Test in Zsh
   zsh -f
   source ./barbarella.zsh
   bbl theme list

   # Test in Bash
   bash --noprofile --norc
   source ./barbarella.bash
   bbl theme list
   ```

5. **Commit your changes**:
   Write clear, concise commit messages:
   ```bash
   git add .
   git commit -m "feat(themes): add coquette pastel theme"
   ```

6. **Push to your fork**:
   ```bash
   git push origin feature/my-cool-theme
   ```

7. **Open a Pull Request**:
   - Go to the original repository on GitHub.
   - Click **Compare & pull request**.
   - Fill out our PR template with a clear description of what you did.

---

## 🤝 Code of Conduct

Please review our [Code of Conduct](./CODE_OF_CONDUCT.md). By participating in this project, you agree to abide by its terms.

Happy hacking! 💅✨
