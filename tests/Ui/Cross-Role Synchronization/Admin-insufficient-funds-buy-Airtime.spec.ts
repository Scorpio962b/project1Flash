import { test, expect } from '@playwright/test';

test('test', async ({ page }) => {
  await page.goto('http://localhost:4173/');
  await page.getByRole('link', { name: 'Sign In' }).nth(1).click();
    await page.getByRole('textbox', { name: 'Email address' })
    .fill('admin@flashgateway.local');

  await page.getByRole('textbox', { name: 'Password' })
    .fill('Password123!');
  await page.getByRole('button', { name: 'Sign In' }).click();
  // await page.goto('http://localhost:4173/dashboard');
  await page.getByRole('link', { name: 'phone_iphone Buy Airtime' }).click();
  await page.getByRole('button', { name: 'T Telkom' }).click();
  await page.getByRole('textbox', { name: '000 0000' }).click();
  await page.getByRole('textbox', { name: '000 0000' }).fill('658525685');
  await page.getByRole('spinbutton', { name: '0.00' }).click();
  await page.getByRole('spinbutton', { name: '0.00' }).click();
  await page.getByRole('spinbutton', { name: '0.00' }).fill('150');
  await page.getByRole('button', { name: 'Review Payment arrow_forward' }).click();
  await page.getByRole('button', { name: 'Confirm Payment' }).click();
});
