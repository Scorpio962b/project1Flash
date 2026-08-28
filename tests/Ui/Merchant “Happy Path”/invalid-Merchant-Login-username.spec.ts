import { test, expect } from '@playwright/test';

test('test', async ({ page }) => {
  await page.goto('http://localhost:4173/');
  await page.getByRole('link', { name: 'FlashGateway' }).click();
  await page.getByRole('link', { name: 'Sign In' }).nth(1).click();

// valid credentials
  await page.getByRole('textbox', { name: 'Email address' }).fill('nick@flashgateway.local');
  await page.getByRole('textbox', { name: 'Password' }).fill('Password123!');  

  await page.getByRole('button', { name: 'Sign In' }).click();
  await expect(page.getByRole('main').getByText('Invalid credentials',)).toBeVisible({timeout :100000});
  
});