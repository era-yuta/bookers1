class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end
  
  def create
    @libro = Book.new(list_params)
    if @libro.save
      redirect_to "/books/#{@libro.id}", notice: "successfully created"
    else
      redirect_to "/books", notice: "error error error"
    end
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    book = Book.find(params[:id])
    if book.update(list_params)
      redirect_to "/books/#{book.id}", notice: "successfully updated"
    else
      redirect_to "/books/#{book.id}/edit", notice: "error error error"
    end
  end
  
  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to "/books", notice: "successfully deleted"
  end

  
private

  def list_params
    params.require(:book).permit(:title, :body)
  end
  
end