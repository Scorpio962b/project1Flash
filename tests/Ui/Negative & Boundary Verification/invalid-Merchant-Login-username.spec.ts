import { test, expect } from '@playwright/test';
import { loginPage, } from '../../../pages/Merchant-login-test';
test('test', async ({ page }) => {
  test.setTimeout(150000)
  const merchantLogin = new loginPage(page);

  await merchantLogin.open();
  await merchantLogin.login('merct@flashgateway.local','Password123!' )

  await page.getByRole('button', { name: 'Sign In' }).click();
  await expect(page.getByRole('main').getByText('Invalid credentials',)).toBeVisible({timeout :150000});
  
});