import { test, expect } from "@playwright/test";
import { loginPage, } from '../../../pages/Merchant-login-test';
test("Defect  Schedule payment option is not working", async ({ page }) => {
  // Open the application
  test.setTimeout(150000)
  const merchantLogin = new loginPage(page);
  await merchantLogin.open();
  await merchantLogin.login('merchant@flashgateway.local','Password123!' )
  // Go to Transfers
  await page.getByRole("link", { name: "Transfer funds" }).click();
  // Select saved beneficiary
  await page.getByRole("button", { name: "saved beneficiary" }).click();
  
  // Enter transfer amount
  await page.getByRole("spinbutton",{name: "0.00"}).fill("50");
  await page.getByRole("button", { name: "Travel Co" }).click();
  // Enter reference
  await page.getByRole("textbox",{name: "e.g. Invoice INV-2024-001"}).fill("inv-2024-003");
  await page.getByText('schedule').click();
  await page.getByRole('button',{name: "lock Confirm & Transfer"}).click();
  await expect( page.getByRole('status', {name: ''})).toBeVisible({ timeout: 150000 });
});
