import { test, expect } from "@playwright/test";
import { loginPage, } from '../../../pages/Merchant-login-test';
test("test", async ({ page }) => {
   const merchantLogin = new loginPage(page);
 
   await merchantLogin.open();
   await merchantLogin.login('merchant@flashgateway.local','Password123!' )

//    continue to airtime & data feature
  await page.getByRole('link', { name: 'wifi_tethering Airtime & Data' }).click();
  await page.getByRole('textbox', { name: '000 0000' }).click();
  await page.getByRole('textbox', { name: '000 0000' }).fill('824476589');
  await page.getByRole('button', { name: 'Data Bundles' }).click();
  await page.getByRole('button', { name: 'R 50', exact: true }).click();
  await page.getByRole('button', { name: 'Review Payment arrow_forward' }).click();
  await page.getByRole('button', { name: 'Confirm Payment' }).click();
  
  await expect(page.getByText('Data bundle for Vodacom was')).toBeVisible();
});