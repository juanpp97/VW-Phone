
let app = Vue.createApp({
    data(){
        return{
            productos: [],
            url: '/stock',
            error: false,
            mensaje: "",
            esp: false,
            celularSeleccionado: {},

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

        },
        abrirEsp(id) {
            this.$refs.celulares.style.pointerEvents = "none";
            const pos = this.productos.map(e => e.id).indexOf(id);
            this.celularSeleccionado = this.productos[pos]
            this.esp = true;

            setTimeout(() => {
                this.$refs.espec.style.opacity = 1;
                this.$refs.espec.style.width = 40 + "%";

            }, 1)
        },
        cerrarEsp(event) {
            event.preventDefault();
            this.$refs.espec.style.opacity = 0;
            this.$refs.espec.style.width = 0 + "px";
            this.$refs.celulares.style.pointerEvents = "auto";

            setTimeout(() => {
                this.esp = false;               
            }, 1000)
        },
    }
})
app.mount("#app")

