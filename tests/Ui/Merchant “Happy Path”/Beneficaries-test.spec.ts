import { test, expect } from '@playwright/test';

test('Transfer funds to a saved beneficiary', async ({ page }) => {

  // Open the application
  await page.goto('http://localhost:4173/');

  // Login
  await page.getByLabel('Email').fill('merchant@flashgateway.local');
  await page.getByLabel('Password').fill('Password123!');
  await page.getByRole('button', { name: 'Log in' }).click();

  // Go to Transfers
  await page.getByRole('link', { name: 'Transfers' }).click();

  // Select saved beneficiary
  await page.getByText('Acme Supplies').click();

  // Enter transfer amount
  await page.getByLabel('Amount').fill('100');

  // Enter payment/reference
  await page.getByLabel('Reference').fill('inv-2024-002');

  // Verify the entered information before submitting
  await expect(page.getByText('Acme Supplies')).toBeVisible();
  await expect(page.getByLabel('Amount')).toHaveValue('100');
  await expect(page.getByLabel('Reference')).toHaveValue('inv-2024-002');

  // Submit transfer
  await page.getByRole('button', { name: /transfer|send|submit/i }).click();

  // Verify successful transfer
  await expect(
    page.getByText(/transfer successful|payment successful|success/i)
  ).toBeVisible();
});
