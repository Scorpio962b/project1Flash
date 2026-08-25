import { test, expect } from "@playwright/test";

test("Defect  Schedule payment option is not working", async ({ page }) => {
  // Open the application
  await page.goto("http://localhost:4173/");
  await page.getByRole("link", { name: "Sign In" }).nth(1).click();

  // Login
  await page.getByLabel("Email").fill("merchant@flashgateway.local");
  await page.getByRole("textbox", { name: "Password" }).fill("Password123!");
  await page.getByRole("button", { name: "Sign In" }).click();

  // Go to Transfers
  await page.getByRole("link", { name: "Transfer funds" }).click();

  // Select saved beneficiary
  await page.getByRole("button", { name: "saved beneficiary" }).click();
   await expect(page.getByRole("button", { name: "Travel Co" })).toBeVisible();
  await page.getByRole("button", { name: "Travel Co" }).click();

  // Enter transfer amount
  await page.getByRole("spinbutton",{name: "0.00"}).fill("50");

  // Enter reference
  await page.getByRole("textbox",{name: "e.g. Invoice INV-2024-001"}).fill("inv-2024-003");

  // Verify transfer details

  // await expect(page.getByLabel("Reference")).toHaveValue("inv-2024-003");

  // Click Schedule Payment
  await page.getByText('schedule').click();
  // await page.getByText('schedule').click();

  // Expected: scheduling options/date selection should appear
  // await expect(
  //   page.getByText(/schedule|transfer date|select date/i),
  // ).toBeVisible();
});
