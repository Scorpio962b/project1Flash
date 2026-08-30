import { test, expect } from '@playwright/test';
import { loginPage, } from '../../../pages/Admin-login-test';
test('Notification Button taking to notification screen', async ({ page }) => {

  // Open the application
 const adminLogin = new loginPage(page);
  
    await adminLogin.open();
    await adminLogin.login('admin@flashgateway.local','Password123!' ) 

  // Verify that the dashboard is displayed
  // await expect(page).toHaveURL('http://localhost:4173/dashboard');

  // Open notifications
  await page.getByRole('button', { name: 'Notifications' }).click();
  await expect(page).toHaveURL('http://localhost:4173/notifications');

 
});