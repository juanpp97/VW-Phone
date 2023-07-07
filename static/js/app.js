
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
            errorForm: false,
            mensajeForm: "",
            hide: true,
            data: {},
            errorBorrar: false,
            mensajeBorrar: "",
            advertencia: false,
            mensajeAdv: "",
            mostrar: false,

        }
    },
    /*Cambio los delimitadores para evitar colisiones con Flask*/
    delimiters: ["[[", "]]"],
    created() {
        this.obtenerProductos();
        this.fade()
    },
    methods:{
        async obtenerProductos(){
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
        cerrarForm(){
            this.$refs.formAd.style.opacity = 0;
            this.$refs.formAd.style.width = 0 + "%";

            setTimeout(() => {
                this.formAdmin = false;
                this.$refs.tabla.style.pointerEvents = "auto";
        
            }, 1000)
        },
        fade(){
            this.temp = setTimeout(() => {
                try {
                    this.$refs.error.style.opacity = 0;
                    this.$refs.errorFlash.style.opacity = 0;
                } catch {}
                setTimeout(() => {
                    this.errorForm = false;
                    this.hide = false;
                    this.mostrar = false;
                }, 750)
            }, 3000)

        },
        enviarForm(event){
            imagen = this.$refs.imagen.value;
            if(imagen == "" && this.add){
                event.preventDefault();
                this.errorForm = true;
                this.mensajeForm = "Debe seleccionar una imagen antes de enviar"

                this.$refs.formAd.scrollTo({ top: 0, behavior: "smooth" });
                this.fade();
                return
            }else
            for(atributo in this.celularSeleccionado){
                if(atributo === "imagen_modelo") continue
                if(this.celularSeleccionado[atributo] === ""){
                    event.preventDefault();
                    this.errorForm = true;
                    this.mensajeForm = "Complete todos los campos antes de enviar"

                    this.$refs.formAd.scrollTo({ top: 0, behavior: "smooth" });
                    this.fade();
                    return
                }
            }
        if(isNaN(Number(this.celularSeleccionado.cantidad))){
            event.preventDefault();
            this.errorForm = true;
            this.mensajeForm = "La cantidad debe ser numérica"
            this.$refs.formAd.scrollTo({ top: 0, behavior: "smooth" });
            this.fade();
            return
        }
        },
        eliminar_caracter(cadena, caracter) {
            if (cadena.endsWith(caracter)) {
                if (cadena.split(caracter).length > 2) {
                    return cadena.split(caracter)[1];
                } else {
                    return cadena.slice(0, -1);
                }
            }
            return cadena;
        },
        formato() {
            precio = this.celularSeleccionado.valor_unitario;
            precio = this.eliminar_caracter(precio, "$");
            this.celularSeleccionado.valor_unitario = precio;
            let decimal = "";
            if (precio.includes(",")) {
                [precio, decimal] = precio.split(",");
                decimal = "," + decimal;
            }
            precio = precio.replace("$", "");

            let precioConPuntos = precio.replace(/\./g, "").replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.");
            this.celularSeleccionado.valor_unitario = "$" + precioConPuntos + decimal;
            //Convertir a numerico
            console.log(precio.slice(1).replace(/\./g, "").replace(",", "."))

        },
        abrirAdv(codigo_producto, imagen){
            this.hide = false;

            this.data = { 'codigo': codigo_producto, 'imagen': imagen }
            this.mensajeAdv = `¿Está seguro que desea borrar el producto de código ${codigo_producto}?`
            this.$refs.tabla.style.pointerEvents = "none";
            this.advertencia = true;
            setTimeout(() => {
                this.$refs.adv.style.opacity = 1;
                this.$refs.adv.style.width = 50 + "%";

            }, 1)
        },
        cerrarAdv(){
            this.$refs.adv.style.opacity = 0;
            this.$refs.adv.style.width = 0 + "%";

            setTimeout(() => {
                this.advertencia = false;
                this.$refs.tabla.style.pointerEvents = "auto";
        
            }, 1000)
        },
        async borrar(){
            const params = this.data

            const response = await fetch('./borrar', {
                method: 'DELETE',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(params)
            });
            window.scrollTo({ top: 0, behavior: "smooth" });

            this.data = await response.json();
            this.advertencia = false;
            this.mostrar = true;
            this.$refs.tabla.style.pointerEvents = "auto";
            this.fade();
            this.obtenerProductos();
        },

    }
})
app.mount("#app")

