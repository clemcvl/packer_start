terraform {
  backend "s3" {
    bucket = "mypackertfstates"
    key    = "tfstates/tftsates"
    region = "ey-west-3"
  }
}