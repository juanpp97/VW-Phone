
let app = Vue.createApp({
    data(){
        return{
            productos: [],
            url: '/stock',
            error: false,
            mensaje: "",
            esp: false,
            celularSeleccionado: {},
            formAdmin: false,
            add: true,


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
            this.$refs.espec.style.width = 0 + "%";

            setTimeout(() => {
                this.esp = false;
                this.$refs.celulares.style.pointerEvents = "auto";
        
            }, 1000)
        },
        abrirForm(id=undefined){
            if(id === undefined){
                this.add = true;
                this.celularSeleccionado = {};
            }else{
                this.add = false;

                const pos = this.productos.map(e => e.id).indexOf(id);
                this.celularSeleccionado = this.productos[pos]
            }
            this.$refs.tabla.style.pointerEvents = "none";
            this.formAdmin = true;

            setTimeout(() => {
                this.$refs.formAd.style.opacity = 1;
                this.$refs.formAd.style.width = 80 + "%";

            }, 1)
        },
        cerrarNuevo(){
            this.$refs.formAd.style.opacity = 0;
            this.$refs.formAd.style.width = 0 + "%";

            setTimeout(() => {
                this.formAdmin = false;
                this.$refs.tabla.style.pointerEvents = "auto";
        
            }, 1000)
        }
    }
})
app.mount("#app")

