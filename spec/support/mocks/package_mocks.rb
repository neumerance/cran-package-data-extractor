def mock_package
  stub_request(:get, "https://cran.r-project.org/web/packages/#{package_name}/").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Ruby'
           }).
         to_return(
           status: 200, body: File.read(
             Rails.root.join('spec/fixtures/package_sample_response.txt')
            ), headers: {}
          )
end
