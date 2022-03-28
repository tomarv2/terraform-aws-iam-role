locals {
  role_name = var.name != null ? var.name : "${var.teamid}-${var.prjid}"
}
