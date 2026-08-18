import { test, expect } from '@playwright/test';

test('test', async ({ page }) => {
    await page.goto('http://localhost:4173/');
  await page.getByRole('link', { name: 'FlashGateway' }).click();
  await page.getByRole('link', { name: 'Sign In' }).nth(1).click();
  await page.getByRole('textbox', { name: 'Email address' }).fill('merchant@flashgateway.local');
  await page.getByRole('textbox', { name: 'Password' }).fill('Password123!');  
  await page.getByRole('button', { name: 'Sign In' }).click();
  await expect(page).toHaveURL(/dashboard/);


  await page.getByRole('link', { name: 'send_money Send Money Local' }).click();
  await page.getByRole('button', { name: 'One-off beneficiary Enter one' }).click();
 
  await page.getByRole('textbox', { name: 'Beneficiary Name' }).fill('Mother');
  
  await page.getByRole('textbox', { name: 'Bank' }).fill('Standard Bank');

  await page.getByRole('textbox', { name: 'Account Number' }).fill('556223450');
  
  await page.getByRole('spinbutton', { name: '0.00' }).fill('10');

  await page.getByRole('textbox', { name: 'e.g. Invoice INV-2024-' }).fill('Groceries');
  await page.getByRole('button', { name: 'lock Confirm & Transfer' }).click();
  
});