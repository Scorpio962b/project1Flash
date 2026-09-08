import { test, expect } from '@playwright/test';
import { loginPage, } from '../../../pages/Admin-login-test';
test('test', async ({ page }) => {
 const adminLogin = new loginPage(page);
 
   await adminLogin.open();
   await adminLogin.login('administrator@flashgateway.local','Password123!' ) 

  await page.getByRole('button', { name: 'Sign In' }).click();
  await expect(page.getByRole('main').getByText('Invalid credentials',)).toBeVisible();
});