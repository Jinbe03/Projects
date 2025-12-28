const imagenesPorDia = {
    0: { image: "img/Volumen_37.webp", title: "My Hero Academia" },
    1: { image: "img/portada-volumen-31-tokyo-revengers.webp", title: "Tokyo Revengers" },
    2: { image: "img/blue-lock.webp", title: "Blue Lock" },
    3: { image: "img/Volumen_12_Portada.webp", title: "Spy x Family" },
    4: { image: "img/c7f830c7735b26e79e18f65cdafeca9f37e84e6a.jpeg", title: "Dan Da Dan" },
    5: { image: "img/jigokuraku131-ddee10c1b55663ee8616856653548143-1024-1024.jpg", title: "Hell's Paradise" },
    6: { image: "img/portada_kaiju-8-n-08__202306280938.jpg", title: "Kaiju No. 8" }
};

const diasEnMes = (mes, anio) => new Date(anio, mes, 0).getDate();

const crearCalendario = (mes, anio) => {
    const diasContenedor = document.getElementById("calendario-dias");
    const mesAnio = document.getElementById("mes-anio");
    diasContenedor.innerHTML = "";

    const primerDia = new Date(anio, mes, 1).getDay();
    const totalDias = diasEnMes(mes + 1, anio);

    mesAnio.innerText = `${new Intl.DateTimeFormat('es-ES', { month: 'long' }).format(new Date(anio, mes))} ${anio}`;

    for (let i = 1; i < primerDia; i++) {
        diasContenedor.innerHTML += "<div></div>";
    }

    for (let i = 1; i <= totalDias; i++) {
        const diaDeLaSemana = new Date(anio, mes, i).getDay();
        diasContenedor.innerHTML += `<div onclick="mostrarImagen(${diaDeLaSemana})">${i}</div>`;
    }
};

let mesActual = new Date().getMonth();
let anioActual = new Date().getFullYear();

const cambiarMes = (incremento) => {
    mesActual += incremento;
    if (mesActual < 0) {
        mesActual = 11;
        anioActual--;
    } else if (mesActual > 11) {
        mesActual = 0;
        anioActual++;
    }
    crearCalendario(mesActual, anioActual);
};

const mostrarImagen = (diaSemana) => {
    const imagenDelDia = imagenesPorDia[diaSemana];

    let modalContent = `<span class="close" onclick="cerrarModal()">&times;</span>`;
    modalContent += `<div>
        <h3>${imagenDelDia.title}</h3>
        <img src="${imagenDelDia.image}" alt="${imagenDelDia.title}">
    </div>`;

    const modal = document.createElement('div');
    modal.className = 'modal';
    modal.innerHTML = `<div class="modal-content">${modalContent}</div>`;
    
    document.body.appendChild(modal);
    modal.style.display = "block";

    modal.onclick = (event) => {
        if (event.target === modal) {
            cerrarModal();
        }
    };
};

const cerrarModal = () => {
    const modal = document.querySelector('.modal');
    if (modal) {
        modal.style.display = "none";
        document.body.removeChild(modal);
    }
};

crearCalendario(mesActual, anioActual);
