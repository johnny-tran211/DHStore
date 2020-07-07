import { HttpClientModule } from '@angular/common/http';
import { AppRoutingModule } from './app-routing.module';
import { ItemsService } from './services/items.service';
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import {
  NbThemeModule,
  NbSidebarModule,
  NbLayoutModule,
  NbButtonModule,
  NbUserModule,
  NbCardModule,
  NbSpinnerModule,
  NbTableModule,
  NbTabsetModule,
  NbDialogModule,
  NbToastrModule,
  NbGlobalPhysicalPosition,
  NbIconModule,
  NbInputModule,
  NbAlertModule,
  NbFormFieldModule
} from '@nebular/theme';
import { MatSliderModule } from '@angular/material/slider';
import { HttpModule } from '@angular/http';
import { AppComponent } from './app.component';
import { HomeComponent } from './home/home.component';
import { ProductDetailComponent } from './home/product-detail/product-detail.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { NbEvaIconsModule } from '@nebular/eva-icons';
import { CartComponent } from './cart/cart.component';
import { FormsModule } from '@angular/forms';
import { HistoryComponent } from './history/history.component';
import { MatSortModule } from '@angular/material/sort';
import { MatTableModule } from '@angular/material/table';
import { MatPaginatorModule } from '@angular/material/paginator';
import { HistoryDetailComponent } from './history/history-detail/history-detail.component';
import { MatBadgeModule } from '@angular/material/badge';
@NgModule({
  declarations: [
    AppComponent,
    HomeComponent,
    ProductDetailComponent,
    CartComponent,
    HistoryComponent,
    HistoryDetailComponent
  ],
  imports: [
    BrowserModule,
    NbThemeModule.forRoot(),
    AppRoutingModule,
    NbLayoutModule,
    NbSidebarModule.forRoot(),
    NbDialogModule.forRoot(),
    NbButtonModule,
    HttpModule,
    NbUserModule,
    NbCardModule,
    NbSpinnerModule,
    MatSliderModule,
    NbTabsetModule,
    NbInputModule,
    NbTableModule,
    NbToastrModule.forRoot({
      destroyByClick: true,
      duration: 1500,
      position: NbGlobalPhysicalPosition.TOP_RIGHT
    }),
    BrowserAnimationsModule,
    NbIconModule,
    NbEvaIconsModule,
    FormsModule,
    NbAlertModule,
    NbFormFieldModule,
    HttpClientModule,
    MatSortModule,
    MatTableModule,
    MatPaginatorModule,
    MatBadgeModule
  ],
  providers: [ItemsService],
  bootstrap: [AppComponent]
})
export class AppModule {}
