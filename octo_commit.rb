ACCESS_TOKEN = '*your access token*'
require 'octokit'
client = Octokit::Client.new(access_token: ACCESS_TOKEN)
repository = "fzngagan/github-api-sync"
branch = "main"
main_branch_sha = client.ref(repository, "heads/#{branch}")[:object][:sha]

md_table = <<-TABLE
| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 2 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |
TABLE
file_sha = client.contents(repository, path: "README.md")[:sha]
blob_sha = client.update_contents(repository, "README.md", "added a markdown table to the description", file_sha, md_table, branch: branch) 