import { NbToastrService } from '@nebular/theme';
import { Injectable } from '@angular/core';
import { NbComponentStatus } from '@nebular/theme';
@Injectable({
  providedIn: 'root'
})
export class ToastrService {
  constructor(public toastrService: NbToastrService) {}
  showToast(
    content: string,
    title: string,
    iconStr: string,
    iconPackStr: string,
    status?: NbComponentStatus
  ) {
    this.toastrService.show(content, title, {
      icon: iconStr,
      iconPack: iconPackStr,
      status: status ? status : 'success'
    });
  }
}
