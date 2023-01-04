require "application_system_test_case"

class CarrosTest < ApplicationSystemTestCase
  setup do
    @carro = carros(:one)
  end

  test "visiting the index" do
    visit carros_url
    assert_selector "h1", text: "Carros"
  end

  test "should create carro" do
    visit carros_url
    click_on "New carro"

    fill_in "Marca", with: @carro.marca
    fill_in "Modelo", with: @carro.modelo
    fill_in "Placa", with: @carro.placa
    fill_in "Valor aluguel", with: @carro.valor_aluguel
    click_on "Create Carro"

    assert_text "Carro was successfully created"
    click_on "Back"
  end

  test "should update Carro" do
    visit carro_url(@carro)
    click_on "Edit this carro", match: :first

    fill_in "Marca", with: @carro.marca
    fill_in "Modelo", with: @carro.modelo
    fill_in "Placa", with: @carro.placa
    fill_in "Valor aluguel", with: @carro.valor_aluguel
    click_on "Update Carro"

    assert_text "Carro was successfully updated"
    click_on "Back"
  end

  test "should destroy Carro" do
    visit carro_url(@carro)
    click_on "Destroy this carro", match: :first

    assert_text "Carro was successfully destroyed"
  end
end
