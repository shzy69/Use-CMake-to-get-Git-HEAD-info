
# reach the root dir of current git repository
execute_process(
  COMMAND git rev-parse --show-toplevel
  WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
  OUTPUT_VARIABLE GIT_REPO_ROOT
  OUTPUT_STRIP_TRAILING_WHITESPACE
)

# get the HEAD's commit ID
# if you want commit id longer than 16, change the number following.
execute_process(
  COMMAND git rev-parse --short=16 HEAD
  WORKING_DIRECTORY ${GIT_REPO_ROOT}
  OUTPUT_VARIABLE GIT_COMMIT_ID
  OUTPUT_STRIP_TRAILING_WHITESPACE
)
# parse the HEAD's time as string
execute_process(
  COMMAND git show -s --format=%ci ${GIT_COMMIT_ID}
  WORKING_DIRECTORY ${GIT_REPO_ROOT}
  OUTPUT_VARIABLE GIT_COMMIT_ID_TIME
  OUTPUT_STRIP_TRAILING_WHITESPACE
)

# define the commit ID and time as macros,
# so they can be used in your executable.(aka. target in CMake)
add_definitions(-DGIT_COMMIT_ID="${GIT_COMMIT_ID}")
add_definitions(-DGIT_COMMIT_ID_TIME="${GIT_COMMIT_ID_TIME}")


