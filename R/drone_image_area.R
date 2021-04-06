#' Calculate the area of land captured in a drone image
#'
#' See the [derivations](https://www.overleaf.com/read/twnpsndycrgw) for
#' diagrams to check which angles are what.
#'
#' @param camera_angle Angle of the camera in degrees, as measured from the
#' height of the drone.
#' @param vertical_fov Vertical field of view of the camera, in degrees.
#' @param horizontal_fov Horizontal field of view of the camera, in degrees.
#' @param height Height of the drone in metres.
#' @param pixel_row Number of rows of pixels recorded.
#' @param pixel_col Number of columns of pixels recorded.
#' @param dim Output a list of the dimensions, two bases and height, of trapezoid.
#'
#' @return Area of the trapezoid captured in the image, measured in metres
#' squared.
#'
#' @export


drone_image_area <- function(camera_angle,
                             vertical_fov,
                             horizontal_fov,
                             height,
                             pixel_row,
                             pixel_col,
                             dim = FALSE) {
  assertthat::assert_that(all(c(camera_angle, vertical_fov, horizontal_fov) < 90) & all(c(camera_angle, vertical_fov, horizontal_fov) > 0),
                          msg = "This code only works for camera angles and fovs between 0 and 90 degrees")

  # convert degrees to radians
  theta <- camera_angle * pi / 180
  phi <- vertical_fov * pi / 180
  omega <- horizontal_fov * pi / 180

  # calculate distance captured D_F - D_C, height of trapezoid
  delta <- height * (tan(phi + theta) - tan(theta))

  # calculate lower base of trapezoid
  w_c <- pixel_col * delta / pixel_row

  # calculate upper base of trapezoid
  w_f <- 2 * delta / tan((pi - omega) / 2) + w_c

  # calculate the area of the trapezoid
  area <- (w_c + w_f) / 2 * delta

  if (isTRUE(dim)) {
    list(
      height = delta,
      width_closest = w_c,
      width_furthest = w_f
    )
  } else {area}

}
