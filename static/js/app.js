
let app = Vue.createApp({
    data(){
        return{
            productos: [],
            url: '/stock',
            error: false,
            mensaje: "",
        }
    },
    /*Cambio los delimitadores para evitar colisiones con Flask*/
    delimiters: ["[[", "]]"],
    created() {
        this.obtenerProductos()
    },
    methods:{
        obtenerProductos(){
            fetch(this.url)
            .then(res => res.json())
            .then(productos => {
                this.productos = productos;
                this.error = false;
            })
            .catch(error => {
                console.log(error);
                this.error = true;
                this.mensaje = "Ocurrio un error al mostrar los productos"
            })
        },
        aumentar(event, cantidad){
            valorCantidad =  event.target.parentElement.children[1].value;
            if(valorCantidad < cantidad) event.target.parentElement.children[1].value++ 
        },
        reducir(event){
            valorCantidad =  event.target.parentElement.children[1].value;
            if(valorCantidad > 0) event.target.parentElement.children[1].value-- 

        }
    }
})
app.mount("#app")

