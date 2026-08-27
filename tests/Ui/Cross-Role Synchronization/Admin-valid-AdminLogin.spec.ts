import { test, expect } from '@playwright/test';
import { loginPage, } from '../../../pages/Merchant-login-test';

test('merchant login', async ({ page }) => {
  test.setTimeout(150000)
  const merchantLogin = new loginPage(page);

  await merchantLogin.open();
  await merchantLogin.login('admin@flashgateway.local','Password123!')
  await expect(page.getByRole('heading',{name: 'Portfolio Overview'})).toBeVisible({timeout :150000});
});