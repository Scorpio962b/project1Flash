import { test, expect } from '@playwright/test';

test('test', async ({ page }) => {
  await page.goto('http://localhost:4173/');
  await page.getByRole('link', { name: 'FlashGateway' });
  await page.getByRole('link', { name: 'Sign In' }).nth(2).click();

// valid credentials
  await page.getByRole('textbox', { name: 'Email address' }).fill('merchant@flashgateway.local');
  await page.getByRole('textbox', { name: 'Password' }).fill('Password123!');  

  await page.getByRole('button', { name: 'Sign In' }).click();
  await expect(page.getByRole('heading', { name: 'Portfolio Overview' })).toBeVisible({timeout :150000});
  
});
