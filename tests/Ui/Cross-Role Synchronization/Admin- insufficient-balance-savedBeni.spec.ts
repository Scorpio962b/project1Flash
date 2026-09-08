import { test, expect } from "@playwright/test";
import { loginPage, } from '../../../pages/Admin-login-test';
test("test", async ({ page }) => {
 const adminLogin = new loginPage(page);
  
    await adminLogin.open();
    await adminLogin.login('admin@flashgateway.local','Password123!' ) 
  await page.getByRole('link', { name: 'send_money Send Money Local' }).click();
  await page.getByRole('button', { name: 'One-off beneficiary Enter one' }).click();
  await page.getByRole('textbox', { name: 'Beneficiary Name' }).fill('Mother');
  await page.getByRole('textbox', { name: 'Bank' }).fill('Standard Bank');
  await page.getByRole('textbox', { name: 'Account Number' }).fill('556223450');
  await page.getByRole('spinbutton', { name: '0.00' }).fill('500');
  await page.getByRole('textbox', { name: 'e.g. Invoice INV-2024-' }).fill('Groceries');
  await page.getByRole('button', { name: 'lock Confirm & Transfer' }).click();
  await expect(page.getByRole('status').getByText('insufficient balance',)).toBeVisible();
})