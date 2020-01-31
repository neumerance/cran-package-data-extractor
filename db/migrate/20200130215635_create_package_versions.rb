class CreatePackageVersions < ActiveRecord::Migration[5.0]
  def change
    create_table :package_versions do |t|
      t.references :package, index: true
      t.string :version, null: false
      t.date :publication
      t.timestamps
    end
  end
end
