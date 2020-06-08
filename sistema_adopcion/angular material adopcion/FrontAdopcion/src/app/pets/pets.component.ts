import { Component, OnInit } from '@angular/core';
import { PetService } from '../services/pet.service'
import { Pet } from '../models/pet';

@Component({
  selector: 'app-pets',
  templateUrl: './pets.component.html',
  styleUrls: ['./pets.component.css']
})



export class PetsComponent implements OnInit {


  pets: Pet[] = [];

  constructor(public petsServices: PetService) {
    this.pets.push({ idPet: 1,
      urlImg: 'aslkdjflk',
      name: 'rodolfo',
      race: 'Perro',
      age: '2 Meses',
      description: 'Good boyyy'})
  }

  ngOnInit(): void {
    this.petsServices.getAllPets()
      .subscribe(
        pets => {
          console.log(pets)
          this.pets = pets;
        },
        err => console.log(err)
      )
  }

}
