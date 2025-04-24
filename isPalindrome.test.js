const isPalindrome = require("./isPalindrome");

describe("isPalindrome", () => {
  test("mot palindrome simple", () => {
    expect(isPalindrome("radar")).toBe(true);
  });

  test("mot normal non palindrome", () => {
    expect(isPalindrome("bonjour")).toBe(false);
  });

  test("mot vide", () => {
    expect(isPalindrome("")).toBe(true);
  });

  test("palindrome avec majuscules et espaces", () => {
    expect(isPalindrome("A man a plan a canal Panama")).toBe(true);
  });

  test("entrée non string", () => {
    expect(isPalindrome(12321)).toBe(false);
  });
});

