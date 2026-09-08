import { test, expect } from "@playwright/test";
import { loginPage, } from '../../../pages/Admin-login-test';
test("test", async ({ page }) => {
 const adminLogin = new loginPage(page);
  
    await adminLogin.open();
    await adminLogin.login('admin@flashgateway.local','Password123!' ) 
  await page.getByRole("link", { name: "phone_iphone Buy Airtime" }).click();
  await page.getByRole("button", { name: "M Mtn" }).click();
  await page.getByRole("textbox", { name: "000 0000" }).fill("658525685");
  await page.getByRole("spinbutton", { name: "0.00" }).fill("10");
  await page.getByRole("button", { name: "Review Payment arrow_forward" }).click();
  await page.getByRole("button", { name: "Confirm Payment" }).click();
  await expect( page.getByText('Airtime top-up for Mtn')).toBeVisible({ timeout: 150000 });

})