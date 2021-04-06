test_that("calculate area", {
  area <-
  drone_image_area(
    camera_angle = 25,
    vertical_fov = 53,
    horizontal_fov = 34,
    height = 200,
    pixel_row = 2000,
    pixel_col = 1000
  )

  expect_type(area, "double")
})
