class CreateEbills < ActiveRecord::Migration[7.0]
  def change

    create_table :ebills do |t|
      t.string :userRef
      t.string :ebillRef
      t.numeric :amount
      t.date :dateDue
      t.string :billerRef
      t.timestamps null: false
    end

    create_table :ebill_updates do |t|
      t.string :ebillRef
      t.string :status
      t.timestamps null: false
    end

    create_table :payments do |t|
      t.string :paymentRef
      t.string :ebillRef
      t.date :dateSubmitted
      t.numeric :amount
      t.string :fromAccountRef
      t.timestamps null: false
    end

    add_reference :ebill_updates, :ebill
    add_reference :payments, :ebill

  end
end
