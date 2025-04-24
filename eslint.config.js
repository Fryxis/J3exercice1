import js from "@eslint/js";
import globals from "globals";

export default [
  {
    files: ["**/*.js"],
    languageOptions: {
      ecmaVersion: 2021,
      globals: {
        ...globals.node,
        ...globals.es2021,
        ...globals.jest, // 👈 on ajoute jest ici
      },
    },
    plugins: {},
    rules: {
      semi: ["error", "always"],
      quotes: ["error", "double"],
    },
  },
];

