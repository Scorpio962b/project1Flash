import { test, expect } from '@playwright/test';
import { loginPage, } from '../../../pages/Merchant-login-test';
test('Notification Button taking to notification screen', async ({ page }) => {
  // Open the application
   test.setTimeout(150000)
   const merchantLogin = new loginPage(page);
   await merchantLogin.open();
   await merchantLogin.login('merchant@flashgateway.local','Password123!' )
  // Open notifications
  await page.getByRole('button', { name: 'Notifications' }).click();
  await expect( page.getByRole('heading', {name: 'Notifications'})).toBeVisible({ timeout: 150000 });
});
