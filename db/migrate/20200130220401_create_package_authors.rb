class CreatePackageAuthors < ActiveRecord::Migration[5.0]
  def change
    create_table :package_authors do |t|
      t.references :contributor, index: true
      t.references :package_version, index: true
      t.timestamps
    end
  end
end
