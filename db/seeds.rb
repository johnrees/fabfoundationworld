# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Tool.delete_all
Tool.create([
  { name: "Laser Cutter" },
  { name: "3D Printer" },
  { name: "Precision Milling Tool" },
  { name: "CNC Router" },
  { name: "Vinyl Cutter" },
  { name: "Electronics Workbench" },
  { name: "Robot" },
  { name: "Other Tools" }
])