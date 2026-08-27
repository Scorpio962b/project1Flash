import {Page} from '@playwright/test'

export class loginPage{
    constructor(private page : Page){};

async open(){
    await this.page.goto("http://localhost:4173/");
    await this.page.getByRole('link', { name: 'Sign In' }).nth(1).click();
}
async login(Email:string, Password:string){
await this.page.getByRole('textbox', { name: 'Email address' }).fill(Email);
await this.page.getByRole('textbox', { name: 'Password' }).fill(Password);
await this.page.getByRole('button', { name: 'Sign In' }).click();
}
}