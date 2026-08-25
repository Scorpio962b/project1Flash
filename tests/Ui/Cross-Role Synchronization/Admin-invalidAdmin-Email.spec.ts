import { test, expect } from '@playwright/test';
test('Invalid Admin Email', async ({ page }) => {
  await page.goto('http://localhost:4173/');
  await page.getByRole('link', { name: 'FlashGateway' }).click();
  await page.getByRole('link', { name: 'Sign In' }).nth(2).click();

  // Invalid credentials
  await page.getByRole('textbox', { name: 'Email address' }).fill('invalid@flashgateway.local');
  await page.getByRole('textbox', { name: 'Password' }).fill('Password123!');

  await page.getByRole('button', { name: 'Sign In' }).click();

  // Expected: Error message for invalid email
  await expect(page.getByText('Invalid email or password')).toBeVisible();
});