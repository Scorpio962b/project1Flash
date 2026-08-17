import { test, expect } from "@playwright/test";

test("test", async ({ page }) => {
  await page.goto("http://localhost:4173/");
  await page.getByRole("link", { name: "Sign In" }).nth(1).click();

  await page.getByRole("button", { name: "Create account" }).click();
  //Fill in form
  await page.getByRole("textbox", { name: "First name" }).click();
  await page.getByRole("textbox", { name: "First name" }).fill("Nick");

  await page.getByRole("textbox", { name: "Last name" }).click();
  await page.getByRole("textbox", { name: "Last name" }).fill("Smallz");

  await page.getByRole("textbox", { name: "Email address" }).click();
  await page
    .getByRole("textbox", { name: "Email address" })
    .fill("nicksmallz@gmail.com");

  await page.getByRole("textbox", { name: "Phone (optional)" }).click();
  await page
    .getByRole("textbox", { name: "Phone (optional)" })
    .fill("0785647800");

  await page.getByRole("textbox", { name: "Password", exact: true }).click();
  await page
    .getByRole("textbox", { name: "Password", exact: true })
    .fill("nick123");

  await page.getByRole("textbox", { name: "Confirm password" }).click();
  await page.getByRole("textbox", { name: "Confirm password" }).fill("nick123");

  await page
    .getByRole("checkbox", { name: "I agree to the terms and" })
    .check();

  await page.getByRole("button", { name: "Create account" }).click();
});
