import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http'
import { Pet } from '../models/pet';

@Injectable({
  providedIn: 'root'
})
export class PetService {

  constructor(private http:HttpClient) { }

  getAllPets(){
    return this.http.get<Pet[]>('./pet/')
  }

  postNewPet(newPet: Pet){
    return this.http.post<Pet>('./pet/', newPet)
  }

  updatePet(newPet: Pet){
    return this.http.put<Pet>('./pet/'+newPet.idPet, newPet)
  }

  deletePet(idPet: number){
    return this.http.delete<Pet>('./pet/'+idPet)
  }

}
