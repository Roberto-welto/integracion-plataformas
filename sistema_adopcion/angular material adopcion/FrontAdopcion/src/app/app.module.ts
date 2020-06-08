import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import {  RouterModule,Route } from '@angular/router';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { PetsComponent } from './pets/pets.component'

// import { MaterialModule } from './material.module'
import { MatButtonModule } from '@angular/material/button';
import {MatCardModule} from '@angular/material/card';

const routes: Route[] = [
  {path:'', component: PetsComponent},
  {path:'user/',component: PetsComponent},
  // {path:'user/', component:},
]

@NgModule({
  declarations: [
    AppComponent,
    PetsComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MatButtonModule,
    MatCardModule,
    RouterModule.forRoot(routes)
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
