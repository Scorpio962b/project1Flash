import { test, expect } from '@playwright/test';

test('Notification Button taking to notification screen', async ({ page }) => {

  // Open the application
  await page.goto('http://localhost:4173/');

  // Open Sign In
  await page.getByRole('link', { name: 'Sign In' }).nth(1).click();

  // Login
  await page.getByLabel('Email').fill('admin@flashgateway.local');
  await page.getByRole('textbox', { name: 'Password' }).fill('Password123!');
  await page.getByRole('button', { name: 'Sign In' }).click();

  // Verify that the dashboard is displayed
  // await expect(page).toHaveURL('http://localhost:4173/dashboard');

  // Open notifications
  await page.getByRole('button', { name: 'Notifications' }).click();
  await expect(page).toHaveURL('http://localhost:4173/notifications');

 
});