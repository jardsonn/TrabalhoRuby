//= require jquery3

function updateDateLimit() {
    const inputStartTime = $('#emprestimo_data_inicial')
    const inputEndTime = $('#emprestimo_data_final')
    inputEndTime.attr("min", inputStartTime.val());
    let end_date = new Date(inputEndTime.val())
    if (new Date(inputStartTime.val()) > new Date(inputEndTime.val())) {
        end_date.setDate(end_date.getDate() + 1)
        inputEndTime.val(end_date.toLocaleString());
    }
}

updateDateLimit()
$(document).ready(function () {

    const inputStartTime = $('#emprestimo_data_inicial')
    const inputEndTime = $('#emprestimo_data_final')

    $('form[id="emprestimo-form"]').on('change', function () {
        updateDateLimit()
        if (inputStartTime.val() !== '' && inputEndTime.val() !== '') {
            let btnAlugar = $('#btn-emprestimos')
            let valorFinalInput = $('#valor-final-show')
            btnAlugar.attr("disabled", false);
            valorFinalInput.removeClass("hidden");

            const diffInTime = new Date(inputEndTime.val()) - new Date(inputStartTime.val());
            const diffInDays = diffInTime / (1000 * 3600 * 24);
            const valorAluguel = parseFloat($('#emprestimo_valor').val())
            const valorFinal = diffInDays * valorAluguel
            if (diffInDays < 0) {
                btnAlugar.attr("disabled", true);
                valorFinalInput.addClass("hidden");
            }

            const formatado = `R$ ${valorFinal.toFixed(2).replace(".", ",")}`;
            $('#valor-final').text(formatado)
            console.log(diffInDays)
        } else {
            $('#btn-emprestimos').attr("disabled", true);
            $('#valor-final-show').addClass("hidden");
        }

    });
});

$("#new_user").on('change', function () {

})

$("#show-password").on('change', function () {
    let inputPass = $("#user_password")
    let inputPassConfirmation = $("#user_password_confirmation")
    inputPass.attr("type", this.checked ? "text" : "password")
    inputPassConfirmation.attr("type", this.checked ? "text" : "password")
})

// $("#user_password_confirmation").on("focusout", function (){
//     const errorClass = "bg-red-50 border border-red-500 text-red-900 placeholder-red-700 text-sm rounded-lg focus:ring-red-500 focus:border-red-500 block w-full p-2.5 dark:bg-red-100 dark:border-red-400"
//     const normalClass = "bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full pl-10 p-2.5 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500"
//     const input = $("#user_password_confirmation")
//     if (input.val() !== $("#user_password").val()){
//         input.addClass(errorClass).removeClass(normalClass)
//     }else {
//         input.addClass(normalClass).removeClass(errorClass)
//     }
// })

$("#input-aluguel").on("keyup", function () {
    let value = this.value;
    value = value.replace(/[^0-9]/g, "");
    value = value.replace(/(\d{1,2})$/, ",$1");
    value = value.replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.");
    // value = "R$ " + value;
    this.value = value;
    $("#output-aluguel").val(unformatValue(this.value))
})


function unformatValue(valor) {
    return valor.replace(/[^0-9\,\.]+/g, "").replace(",", ".");
}

