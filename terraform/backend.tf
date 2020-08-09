terraform {
  backend "s3" {
    bucket = "mypackertfstates"
    key    = "tfstates/tftsates"
    region = "eu-west-3"
  }
}