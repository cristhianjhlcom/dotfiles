type Product = {
  name: string;
  price: number;
  available: boolean;
};

const person: string = "Cristhian";
const product: Product = {
  name: "Camisa",
  price: 20.99,
  available: true,
};

function gretting(name: string): string {
  return `Hello ${name}, how are you?`;
}

console.log(gretting(person));
console.log(product.price);
