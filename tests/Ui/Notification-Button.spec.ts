import { test, expect } from '@playwright/test';

test('Defect - Notification Button not working', async ({ page }) => {

  // Open the application
  await page.goto('http://localhost:4173/');

  // Open Sign In
  await page.getByRole('link', { name: 'Sign In' }).nth(1).click();

  // Login
  await page.getByLabel('Email').fill('merchant@flashgateway.local');
  await page.getByRole('textbox', { name: 'Password' }).fill('Password123!');
  await page.getByRole('button', { name: 'Sign In' }).click();

  // Verify that the dashboard is displayed
  await expect(page).toHaveURL('http://localhost:4173/dashboard');

  // Open notifications
  await page.getByRole('button', { name: 'Notifications' }).click();
  await expect(page).toHaveURL('http://localhost:4173/notifications');

  // Locate Transfer History notification
  const transferHistory = page.getByText(/transfer history/i);

  // Verify that Transfer History is displayed
  await expect(transferHistory).toBeVisible();

  // Click the Transfer History notification
  await transferHistory.click();

  // Verify that the transaction alert was opened
  await expect(
    page.getByText('Opened transaction alert #2')
  ).toBeVisible();

  // Expected transaction details
  await expect(
    page.getByText('Acme Supplies')
  ).toBeVisible();

  await expect(
    page.getByText('R100')
  ).toBeVisible();

  await expect(
    page.getByText('inv-2024-002')
  ).toBeVisible();
});
