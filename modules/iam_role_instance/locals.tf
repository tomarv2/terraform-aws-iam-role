locals {
  shared_tags = tomap(
    {
      "Name"    = "${var.teamid}-${var.prjid}",
      "team"    = var.teamid,
      "project" = var.prjid
    }
  )

  role_name = var.name != null ? var.name : "${var.teamid}-${var.prjid}"
}
