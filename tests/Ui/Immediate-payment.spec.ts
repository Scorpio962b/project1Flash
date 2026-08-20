
import { test, expect } from '@playwright/test';

test('Defect - Immediate payment option is not working', async ({ page }) => {

  // Open the application
  await page.goto('http://localhost:4173/');

  // Login
  await page.getByLabel('Email').fill('merchant@flashgateway.local');
  await page.getByLabel('Password').fill('Password123!');
  await page.getByRole('button', { name: 'Log in' }).click();

  // Go to Transfers
  await page.getByRole('link', { name: 'Transfers' }).click();

  // Select saved beneficiary
  await page.getByText('Travel Co').click();

  // Enter transfer amount
  await page.getByLabel('Amount').fill('50');

  // Enter reference
  await page.getByLabel('Reference').fill('inv-2024-003');

  // Verify transfer details
  await expect(page.getByText('Travel Co')).toBeVisible();
  await expect(page.getByLabel('Amount')).toHaveValue('50');
  await expect(page.getByLabel('Reference')).toHaveValue('inv-2024-003');

  // Click Immediate Payment
  await page.getByRole('button', { name: 'Immediate payment' }).click();

  // Expected: immediate payment option should become selected
  await expect(
    page.getByText(/immediate payment/i)
  ).toBeVisible();
});
