import "bootstrap";
import "update_button_avatar";


import swal from 'sweetalert';
import { initSweetalert } from '../plugins/init_sweetalert';
import { copyToClipboard } from '../plugins/init_copy';

// SWEET ALERT BILL

const deleteBox = document.querySelectorAll('.delete-box');
const BillDeleteBoxId = Object.values(deleteBox).map(billDeleteBox => billDeleteBox.id.match(/^\S*/)[0]);

BillDeleteBoxId.forEach( (idSolo) => {
  const id = `${idSolo} alert-delete-bill`;

  const options = {
    title: "💰 Es-tu sûr 💰 ?",
    text: "Tu vas supprimer définitivement une facture. Cette action est irréversible.",
    icon: "warning"
  };

  const callback = ( (value) => {
    if (value) {
      const link = document.getElementById(`${idSolo}delete-link`);
      link.click();
    };
  });

  initSweetalert(id, options, callback);
});


// SWEET ALERT REFUND

initSweetalert('alert-transaction', {
  title: " 💰 Es-tu sûr? 💰 ",
  text: "Remboursement de la facture via Lydia. Cette action est irréversible",
  icon: "warning"
}, (value) => {
  if (value) {
    const link = document.getElementById('add-transaction');
    link.click();
  }
});




